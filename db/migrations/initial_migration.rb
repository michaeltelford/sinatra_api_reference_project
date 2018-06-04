ActiveRecord::Schema.define do
  create_table :albums do |table|
      table.column :title, :string
      table.column :performer, :string
  end
  create_table :tracks do |table|
      table.column :album_id, :integer
      table.column :track_number, :integer
      table.column :title, :string
  end
end
