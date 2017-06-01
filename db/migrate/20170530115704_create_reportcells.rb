class CreateReportcells < ActiveRecord::Migration[5.0]
  def change
    create_table :reportcells do |t|
      t.string :dep_name
      t.string :lab_name
      t.string :res_name
      t.string :kind
      t.float :total
      t.string :onu
      t.string :state
      t.string :blend
      t.string :code
      t.string :unit
      t.integer :res_id
      t.belongs_to :report, index: true, foreign_key: true

      t.timestamps
    end
  end
end
