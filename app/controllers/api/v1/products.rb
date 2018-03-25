module API
  module V1
    class Products < Grape::API
      include API::V1::Defaults

      resource :products do
        desc "Return all products"
        get "", root: :products do
          data = []
          Product.all.each do |p|
            result = {
              response: "Successful",
              data: {
                id: p.id,
                uuid: p.uuid,
                images: p.images_urls,
                tags: p.tag_list.split(","),
                sell_status: p.sell_status,
                created: p.created_at,
                updated: p.updated_at
              }
            }
            data << result
          end
          return data
        end

        desc "Return a product"
        params do
          requires :uuid, type: String, desc: "UUID of the
            product"
        end
        get ":uuid", root: "product" do

          result = Product.find_by(uuid: permitted_params[:uuid])

          if !result.nil?
            data = {
              response: "Successful",
              data: {
                id: result.id,
                uuid: result.uuid,
                images: result.images_urls,
                tags: result.tag_list.split(","),
                sell_status: result.sell_status,
                created: result.created_at,
                updated: result.updated_at
              }
            }
          else
            data = {
              response: "Error",
              data: result
            }
          end

          return data
        end
      end
    end
  end
end