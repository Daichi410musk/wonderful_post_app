# タグを先に用意する（名前は好きなのでOK）
tag_names = %w[Ruby Rails Tech Life]
tags = tag_names.map { |name| Tag.find_or_create_by!(name: name) }

users_data = [
  { email: 'user001@test.com', number: '001' },
  { email: 'user002@test.com', number: '002' },
  { email: 'user003@test.com', number: '003' }
]

users_data.each do |data|
  # 1) ユーザーを存在チェックしながら作成
  user = User.find_or_create_by!(email: data[:email]) do |u|
    u.password = 'test1234'
    u.password_confirmation = 'test1234'
  end

  # 2) 各ユーザーに50件の記事を持たせる
  (1..50).each do |i|
    title = "No.#{i}: user#{data[:number]}の記事"
    body  = "No.#{i}: user#{data[:number]}の記事の本文"

    article = user.articles.find_or_create_by!(title: title) do |a|
      a.content = body
    end

    # 3) 作った（or 既にあった）記事に全部のタグを付ける
    article.tags = tags
  end
end

puts 'seeds done.'

