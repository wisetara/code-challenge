class AddAttachmentPdfToLeads < ActiveRecord::Migration
  def self.up
    change_table :leads do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :leads, :pdf
  end
end