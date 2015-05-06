http://api.rubyonrails.org/classes/ActiveRecord/Migration.html

drop_table(name): Drops the table called name.

change_table(name, options): Allows to make column alterations to the table called name. It makes the table object available to a block that can then add/remove columns, indexes or foreign keys to it.

rename_table(old_name, new_name): Renames the table called old_name to new_name.

add_column(table_name, column_name, type, options): Adds a new column to the table called table_name named column_name specified to be one of the following types: :string, :text, :integer, :float, :decimal, :datetime, :timestamp, :time, :date, :binary, :boolean. A default value can be specified by passing an options hash like { default: 11 }. Other options include :limit and :null (e.g. { limit: 50, null: false }) – see ActiveRecord::ConnectionAdapters::TableDefinition#column for details.

rename_column(table_name, column_name, new_column_name): Renames a column but keeps the type and content.

change_column(table_name, column_name, type, options): Changes the column to a different type using the same parameters as add_column.

remove_column(table_name, column_name, type, options): Removes the column named column_name from the table called table_name.

feedback_loop
study and read
http://www.sitepoint.com/ruby-net-http-library/
https://github.com/augustl/net-http-cheat-sheet
