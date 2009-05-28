class ItemsController < ApplicationController
  PER_PAGE = 10
  # GET /items
  # GET /items.xml
  def index
    @title = "Let's share"
    @item = Item.new
    @items = Item.paginate :page => params[:page], :per_page => PER_PAGE, :order => "created_at desc"
    tag_cloud

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])
    @item.creator = current_user if current_user


    respond_to do |format|
      if @item.save
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to(@item) }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to(@item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end

  def tag
    redirect_to :action => :index unless params[:id]
    @item = Item.new
    @items = Item.paginate_by_tag params[:id],:order => 'created_at desc ',:page => params[:page],:per_page => PER_PAGE


    # @items = Item.find_tagged_with(params[:id])
    # paginate @items
    tag_cloud

    respond_to do |format|
      format.html { render :action => :index} # index.html.erb
      format.xml  { render :xml => @items }
    end

  end
private
  def tag_cloud
    @tags = Item.tag_counts
  end
end
