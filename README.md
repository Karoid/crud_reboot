#본 프로젝트의 내용
본 프로젝트는 멋쟁이 사자처럼 3번째 심화 과제를 작성한 프로젝트입니다

###routes.rb
```ruby
Rails.application.routes.draw do
  get '/' => 'posts#index'
  get 'posts/index'

  get 'posts/show/:post_id' => 'posts#show'

  get 'posts/new'

  post 'posts/create'

  get 'posts/edit/:post_id' => 'posts#edit'

  post 'posts/update'

  get 'posts/delete/:post_id' => 'posts#delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
```
——————————————————————————————————
###post_controller.rb
```ruby
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def new
  end

  def create
    post = Post.create(title:params[:title],content:params[:content])
    redirect_to "/"
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def update
    post = Post.find(params[:post_id])
    post.title = params[:title]
    post.content = params[:content]
    post.save
    redirect_to "/"
  end

  def delete
    post = Post.find(params[:post_id])
    post.destroy
    redirect_to "/"
  end
end
```
——————————————————————————————————
###index.html.erb
```html
<link rel="stylesheet" href="/css/board.css">
<!--게시글 목록 시작-->
<div style="width: 100%;">
<a href="/posts/new" style="width: 100px; padding: 7px; margin: 0px auto 90px; display: block; text-align: center; font-size: 18px; border: 1px solid #dddddd;">새글 쓰기</a>
</div>
<%if !@posts.nil?%>
<table class="table table-hover article_list">
  <thead>
    <tr style="font-size: 20px;">
      <td class="th" style="text-align: left;">#</td>
      <td class="th" style="font-weight: bolder;text-align: left;">제목</td>
      <td class="th">날짜</td>
    </tr>
  </thead>
  <tbody>
    <%@posts.each do |article|%>
    <tr class="<%if article.id == params[:id].to_i %>selected<%end%>">
      <td scope="row"><%=article.id%></th>
      <td><a href="/posts/show/<%=article.id%>"><%=article.title%></a></td>
      <td><span class='hidden-xs'><%=article.created_at.strftime("%Y.")%></span><%=article.created_at.strftime("%m.%d")%></td>
    </tr>
    <%end%>
  </tbody>
</table>
<%end%>
<style media="screen">
#title{
  margin: 60px auto 30px auto;
  text-align: center;
  font-size: 50px;
  font-weight: bold;
}
table thead{border-color: #000000;}
table tr .th {
  border: none;
  border-bottom: 1px solid #000000 !important;
  font-size: 25px;
  text-align: center;
}
.article{margin:0 15px}
.article_list tbody>tr>td a{
  color:#000;
  display:block;
}
.article_list thead>tr>th:nth-child(1),
.article_list tbody>tr>th{
  width: 5%;
  text-align: center;
}
.article_list thead>tr>th:nth-child(3),
.article_list tbody>tr>td:nth-child(3){
  width: 80px;
  text-align: center;
}
.article_list thead>tr>th:nth-child(4),
.article_list tbody>tr>td:nth-child(4){
  width: 70px;
  text-align: center;
}
.article_list thead>tr>th:nth-child(5),
.article_list tbody>tr>td:nth-child(5){
  text-align: center;
}
@media screen and (min-width: 768px){
  .article_list thead>tr>th:nth-child(3),
  .article_list tbody>tr>td:nth-child(3){
    width: 100px!important;
  }
  .article_list thead>tr>th:nth-child(4),
  .article_list tbody>tr>td:nth-child(4){
    width: 120px!important;
  }
  .hidden-xs{
    display: inline-block!important;
  }
}
</style>
```
——————————————————————————————————
###new.html.erb
```html
<form action="/posts/create" method="post">
  제목:<input type="text" name="title"><br>
  <textarea name="content" rows="8" cols="40" placeholder="내용"></textarea><br>
  <input type="submit">
</form>
```
——————————————————————————————————
###show.html.erb
```html
<h1><%=@post.title%></h1>
<p><%=@post.content%></p><br>
<a href="/posts/edit/<%=@post.id%>">수정하기</a><br>
<a href="/posts/delete/<%=@post.id%>">삭제하기</a><br>
```
——————————————————————————————————
###edit.html.erb
```html
<form action="/posts/update" method="post">
  <input type="hidden" name="post_id" value="<%=@post.id%>">
  제목:<input type="text" name="title" value="<%=@post.title%>"><br>
  <textarea name="content" rows="8" cols="40" placeholder="내용"><%=@post.content%></textarea><br>
  <input type="submit">
</form>
```
#Licence
MIT Licence
