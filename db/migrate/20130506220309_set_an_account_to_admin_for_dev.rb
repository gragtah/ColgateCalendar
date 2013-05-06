class SetAnAccountToAdminForDev < ActiveRecord::Migration
  def change
     User.find_by_email("spideyunlimited@gmail.com").update_attribute :admin, true
  end
end
