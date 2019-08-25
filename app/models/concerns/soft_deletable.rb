module SoftDeletable
  extend ActiveSupport::Concern
  included do
    default_scope { where(is_deleted: false) }
    scope :only_deleted, -> { unscope(where: :is_deleted).where(is_deleted: true) }
  end

  def delete
    update_column :is_deleted, true if has_attribute? :is_deleted
  end

  def destroy;
    callbacks_result = transaction do
      run_callbacks(:destroy) do
        delete
      end
    end
    callbacks_result ? self : false
  end

end