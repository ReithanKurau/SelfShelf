class MigrateJournaltoRichBodyShelfInterest < ActiveRecord::Migration[7.1]
  def up
    ShelfInterest.find_each do |article|
      article.update(rich_journal: article.journal)
    end
  end

  def down
    ShelfInterest.find_each do |article|
      article.update(journal: article.rich_journal)
      article.update(rich_journal: nil)
    end
  end
end
