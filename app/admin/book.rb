ActiveAdmin.register Book do
  permit_params :title, :isbn, :published_date, author_books_attributes: [:author_id, :_destroy, :id]

  form do |f|
    f.inputs '書籍登録' do
      f.input :title
      f.input :isbn
      f.input :published_date
      f.has_many :author_books, allow_destroy: true, heading: false,
                                new_record: true do |ab|
        ab.input :author_id,
                 label: '著者',
                 as: :select,
                 collection: Author.all.map { |a| [a.name, a.id] }
      end
      f.actions
    end
  end
  show do
    attributes_table do
      row 'タイトル' do
        resource.title
      end
      row 'ISBN' do
        resource.isbn
      end
      row '出版日' do
        resource.published_date
      end
      row '著者' do
        Author.where(id: AuthorBook.where(book_id: resource.id).all.pluck(:author_id)).all.pluck(:name).join(',')
      end
    end
  end
end
