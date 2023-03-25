class EntitiesController < ApplicationController
  before_action :set_group
  before_action :set_entity, only: %i[show edit update destroy]

  # GET /groups/:group_id/entities
  def index
    @entities = @group.entities.group_by { |entity| [entity.user_id, entity.group_id] }
    @totals = {}
    @entities.each do |(user_id, group_id), entities|
      @totals[[user_id, group_id]] = entities.sum(&:amount)
    end
  end

  # GET /groups/:group_id/entities/new
  def new
    @entity = @group.entities.build
  end

  # POST /entities or /entities.json
  def create
    @entity = Entity.new(entity_params)

    respond_to do |format|
      if @entity.save
        format.html { redirect_to group_entities_path(@entity.group_id), notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_entity
    @entity = @group.entities.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount, :user_id, :group_id)
  end
end
