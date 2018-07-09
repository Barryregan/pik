class ThemeTool < ApplicationRecord
    belongs_to :tool
    belongs_to :theme
end