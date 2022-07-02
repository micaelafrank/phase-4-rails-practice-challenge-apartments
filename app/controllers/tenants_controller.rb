class TenantsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    def index
       tenants = Tenant.all
       render json: tenants
    end

    def show
        tenant = find_tenant
        render json: tenant 
    end

    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created
    end

    def update
        tenant = find_tenant
        tenant.update!(tenant_params)
        render json: tenant, status: :updated
    end

    def destroy
        tenant = find_tenant
        tenant.destroy
        head :no_content 
    end

    private

    def find_tenant
        Tenant.find_by(params[:id])
    end

    def tenant_params
        params.permit(:name, :age)
    end

    def not_found
        render json: {error: "Tenant not found. Try again!"}, status: :not_found
    end

    def render_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
