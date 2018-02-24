ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, force: true do |t|
    t.string :name
    t.belongs_to :company

    t.timestamps
  end

  ### POLYMORPHIC ASSOCIATIONS ###

  create_table :pictures, force: true do |t|
    t.references :imageable, polymorphic: true, index: true
    t.timestamps
  end

  create_table :companies, force: true do |t|
    t.string :name
    t.timestamps
  end
end