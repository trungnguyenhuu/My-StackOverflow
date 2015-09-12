class CreateVotes < ActiveRecord::Migration
        def change
                create_table :votes do |t|
                        t.boolean :vote_up
                        t.references :votable, polymorphic: true, index: true
                        t.references :user, index: true, foreign_key: true

                        t.timestamps null: false
                end
        end
end
