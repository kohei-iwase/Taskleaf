FactoryBot.define do 
	factory :task do
		name {'テストを書く'}
		description{'色々準備する'}
		user
	end
end