class ApartmentsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :apartment_not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid_apt

    def index
        render json: Apartment.all
    end

    def show
        apartment = find_apartment
        render json: apartment 
    end

    def create
        apartment = Apartment.create!(apartment_params)
        render json: apartment, status: :created
    end

    def update
        apartment = find_apartment
        apartment.update!(apartment_params)
        render json: apartment, status: :updated
    end

    def destroy
        apartment = find_apartment
        apartment.destroy
        head :no_content 
    end

    private

    def find_apartment
        Apartment.find_by(params[:id])
    end

    def apartment_params
        params.permit(:number)
    end

    def apartment_not_found
        render json: {error: "Apartment not found"}, status: :not_found
    end

    def invalid_apt
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
