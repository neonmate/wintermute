module InputBaseExtension
  def label(*)
    if @options[:spec_label]
      @builder.spec_label(attribute_name)
    else
      super
    end
  end
end

SimpleForm::Inputs::Base.prepend(InputBaseExtension)
