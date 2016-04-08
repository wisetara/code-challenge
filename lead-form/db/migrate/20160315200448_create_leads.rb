class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number

      t.integer :interest_rate
      t.integer :loan_amount
      t.integer :down_payment

      t.timestamps null: false
    end
  end
end
