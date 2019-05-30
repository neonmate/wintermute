namespace :db do

  desc 'Dump production into development'
  task dump: :environment do
    unless Rails.env.development?
      raise 'This task is not intended to be run in any other environment except development'
    end

    current_time = Time.now.strftime('%Y%m%d%H%M%S')
    path = "tmp/production_#{current_time}.dump"

    puts 'Dumping production...'

    stdout_and_stderr_str, status = Open3.capture2e('heroku', 'pg:backups:capture')
    unless status.success?
      puts stdout_and_stderr_str
    end

    stdout_and_stderr_str, status = Open3.capture2e('heroku', 'pg:backups:download', '--output', path)
    unless status.success?
      puts stdout_and_stderr_str
    end

    puts 'Loading production dump...'

    database_configuration = Rails.configuration.database_configuration[Rails.env]
    host = database_configuration.fetch('host')
    username = database_configuration.fetch('username')
    password = database_configuration.fetch('password')
    database = database_configuration.fetch('database')

    ENV['PGPASSWORD'] = password if password.present?

    pg_restore_command = []
    pg_restore_command << 'pg_restore'
    pg_restore_command << '--verbose'
    pg_restore_command << '--clean'
    pg_restore_command << '--no-acl'
    pg_restore_command << '--no-owner'

    if host.present?
      pg_restore_command << '-h'
      pg_restore_command << host
    end

    if username.present?
      pg_restore_command << '-U'
      pg_restore_command << username
    end

    if database.present?
      pg_restore_command << '-d'
      pg_restore_command << database
    end

    pg_restore_command << path

    stdout_and_stderr_str, status = Open3.capture2e(*pg_restore_command)

    unless status.success?
      puts stdout_and_stderr_str
    end

    puts 'Done.'
  end

end
