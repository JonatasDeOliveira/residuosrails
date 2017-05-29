class CreateResidues < ActiveRecord::Migration[5.0]
  def change
    create_table :residues do |t|
      t.string :name
      t.string :type
      t.string :blend
      t.string :onu
      t.string :code
      t.belongs_to :laboratory, index: true, foreign_key: true

      t.timestamps
    end
  end
end