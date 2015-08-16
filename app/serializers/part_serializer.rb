class PartSerializer < ActiveModel::Serializer
  attributes :id, :type_name, :manufacturer, :model, :details, :link, :description, :amzdesc, :amzprice, :amzshipping, :incompatibleparts
end
