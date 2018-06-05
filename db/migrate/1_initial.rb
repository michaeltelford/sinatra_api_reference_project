ROM::SQL.migration do
  change do
    create_table :albums do
      primary_key :id
      column :name, String, null: false
    end
    create_table :tracks do
      primary_key :id
      column :title, String, null: false
    end
  end
end
