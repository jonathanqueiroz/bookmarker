# frozen_string_literal: true

module Renderer
  def render_object(resource, **options)
    render({
      json: resource,
      root: 'data',
      status: :ok,
      meta: assign_metadata(resource)
    }.merge(options))
  end

  def render_errors(errors, status = :unprocessable_entity)
    render json: { errors: errors.messages }, status: status
  end

  private

  def assign_metadata(resource)
    count = resource.respond_to?(:count) ? resource.count : 1
    resource_name = (resource.try(:first)&.class || resource.class).to_s

    { resource: resource_name, count: count }
  end
end
