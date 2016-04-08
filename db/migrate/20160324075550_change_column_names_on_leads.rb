class ChangeColumnNamesOnLeads < ActiveRecord::Migration
  def change
    rename_column :leads, :title, :encrypted_title
    rename_column :leads, :first_name, :encrypted_first_name
    rename_column :leads, :last_name, :encrypted_last_name
    rename_column :leads, :email, :encrypted_email
    rename_column :leads, :phone_number, :encrypted_phone_number

    add_column :leads, :encrypted_title_iv, :string
    add_column :leads, :encrypted_first_name_iv, :string
    add_column :leads, :encrypted_last_name_iv, :string
    add_column :leads, :encrypted_email_iv, :string
    add_column :leads, :encrypted_phone_number_iv, :string
  end
end
