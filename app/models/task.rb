class Task < ApplicationRecord
#	before_validation :set_nameless_name
	belongs_to :user
	validates 	:name, presence: true, length:{ maximum: 30 }
	validate 	:validate_name_not_including_comma

	private
		def validate_name_not_including_comma
			errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
		end

#シングルクオーテーションにするとたまにバグる
		def set_nameless_name
			self.name = "件名なし" if name.blank?
		end
end
