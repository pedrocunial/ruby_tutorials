class CreateUsers < ActiveRecord::Migration[5.0]
  # originally this had the method "change", but we changed it to
  # up and down soo that we can drop our tables and generated them
  # as we want
  def up
    # creating our db here allows us for more portability, since
    # we can change hosts at any time without any concern towards
    # that (it generates automatically)
    # we can create it by using the command:
    # $ rake db:migrate
    # you can also "travel" betwen versions by using the flag
    # VERSION=?, for example: VERSION=0 would bring you to the
    # "no db" version of the project, by using
    # $ rake db:migrate:status
    # you can get the id of your versions and therefore "travel" to
    # them
    create_table :users do |t|
      t.string "email", :limit => 50, :null => false
      t.column "password", :string, :limit => 30, :null => false
      # binary, boolean, data, datetime, decimal, float, integer
      # :default => default value
      t.timestamps :null => false
    end
  end

  def down
    # destroying our table
    drop_table :users
  end
end
