describe UserMailer, type: :mailer do

  describe 'subscriber_notification' do
    def build_mail(subscribable)
      subscriber = create(:user, email: 'subscriber@example.com')
      writer = create(:user, nickname: 'thomas')

      message = subscribable.messages.create(user: writer, body: 'Here is an update')
      subscription = subscribable.user_subscriptions.create(user: subscriber)

      mail = described_class.subscriber_notification(subscription, message)
      Premailer::Rails::Hook.perform(mail)
    end

    def html_part(mail)
      mail.html_part.decode_body.lines.map(&:squish).select(&:present?).join("\n")
    end

    def text_part(mail)
      mail.text_part.decode_body
    end

    it 'renders the email for an idea' do
      subscribable = create(:idea, id: 1, title: 'Some idea')
      mail = build_mail(subscribable)

      expect(mail.from).to contain_exactly('no-reply@wintermute.app')
      expect(mail.to).to contain_exactly('subscriber@example.com')
      expect(mail.subject).to eq(%(@thomas replied to the subscribed idea "Some idea"))

      expect(html_part(mail)).to eq(<<~HTML.strip)
        <!DOCTYPE html>
        <html>
        <head>
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
        </head>
        <body>
        <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
        <p>thomas left a reply to idea "Some idea":</p>
        <p>
        """
        <br>
        Here is an update
        <br>
        """
        </p>
        <p>
        More details:
        <a href="http://www.example.com/ideas/1">http://www.example.com/ideas/1</a>
        </p>
        </body>
        </html>
      HTML

      expect(text_part(mail)).to eq(<<~TEXT.strip)
        thomas left a reply to idea "Some idea":

        """

        Here is an update

        """

        More details:
        http://www.example.com/ideas/1
      TEXT
    end

    it 'renders the email for a repository' do
      subscribable = create(:repository, id: 1, owner: 'ms', name: 'repo_1')
      mail = build_mail(subscribable)

      expect(mail.from).to contain_exactly('no-reply@wintermute.app')
      expect(mail.to).to contain_exactly('subscriber@example.com')
      expect(mail.subject).to eq(%(@thomas replied to the subscribed repository "ms/repo_1"))

      expect(html_part(mail)).to eq(<<~HTML.strip)
        <!DOCTYPE html>
        <html>
        <head>
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
        </head>
        <body>
        <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
        <p>thomas left a reply to repository "ms/repo_1":</p>
        <p>
        """
        <br>
        Here is an update
        <br>
        """
        </p>
        <p>
        More details:
        <a href="http://www.example.com/repositories/1">http://www.example.com/repositories/1</a>
        </p>
        </body>
        </html>
      HTML

      expect(text_part(mail)).to eq(<<~TEXT.strip)
        thomas left a reply to repository "ms/repo_1":

        """

        Here is an update

        """

        More details:
        http://www.example.com/repositories/1
      TEXT
    end
  end

end
