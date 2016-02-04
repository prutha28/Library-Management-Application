class AddSuggestionToBooks < ActiveRecord::Migration
  def change
    add_column :books, :suggestion_status, :string, :default => "Approved"
  end
end
