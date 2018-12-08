<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController

  def index
    load_<%= plural_table_name %>
  end

  def show
    load_<%= singular_table_name %>
  end

  def new
    build_<%= singular_table_name %>
  end

  def edit
    load_<%= singular_table_name %>
    build_<%= singular_table_name %>
  end

  def create
    build_<%= singular_table_name %>

    if @<%= singular_table_name %>.save
      redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully created.'" %>
    else
      render :new
    end
  end

  def update
    load_<%= singular_table_name %>
    build_<%= singular_table_name %>

    if @<%= singular_table_name %>.save
      redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully updated.'" %>
    else
      render :edit
    end
  end

  private

  def load_<%= plural_table_name %>
    @<%= plural_table_name %> ||= <%= class_name %>.order(:id)
  end

  def build_<%= singular_table_name %>
    @<%= singular_table_name %> ||= <%= class_name %>.new
    @<%= singular_table_name %>.attributes = <%= singular_table_name %>_params
  end

  def load_<%= singular_table_name %>
    @<%= singular_table_name %> ||= <%= class_name %>.find(params[:id])
  end

  def <%= singular_table_name %>_params
    <%= singular_table_name %>_params = params[:<%= singular_table_name %>]

    if <%= singular_table_name %>_params.present?
      <%= singular_table_name %>_params.permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
    else
      {}
    end
  end
end
<% end -%>
