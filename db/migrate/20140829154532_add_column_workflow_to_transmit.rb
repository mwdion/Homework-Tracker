class AddColumnWorkflowToTransmit < ActiveRecord::Migration
  def change
    add_column :transmits, :workflow_state, :string
  end
end
