create database AppleStorePRJ
use AppleStorePRJ

create table Role(
RoleID int identity(1,1) primary key,
RoleName nvarchar(50) not null
)

create table Users(
UserID int identity(1,1) primary key,
UserName nvarchar(50) unique not null,
Email nvarchar(50) unique not null,
Tel varchar(10) unique not null,
Password nvarchar(50) not null,
Status bit not null,
RoleID int not null,
FirstName nvarchar(50),
LastName nvarchar(50),
Address nvarchar(100),
Zipcode varchar(20),
constraint FK_User_Role foreign key (RoleID) references Role(RoleID) on update cascade,
constraint CK_Tel CHECK (Tel LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') 
)

create table Category(
CategoryID int identity(1,1) primary key,
CategoryName nvarchar(50) not null,
)

create table Product(
ProductID int identity(1,1) primary key,
ProductName nvarchar(50) not null,
CategoryID int not null,
Price decimal not null,
Stock int not null,
DateUpdate date default getdate(),
Status bit not null,
ImageURL nvarchar(100) not null,
Description nvarchar(100) not null,
MetaContent nText not null,
constraint FK_Product_Category foreign key (CategoryID) references Category(CategoryID) on update cascade,
)

create table Feedback(
UserID int not null,
ProductID int not null,
Status bit not null,
Rating int not null,
DateUpdate date default getdate(),
constraint PK_Feedback primary key (UserID, ProductID),
constraint FK_Feedback_User foreign key (UserID) references Users(UserID) on update cascade,
constraint FK_Feedback_Product foreign key (ProductID) references Product(ProductID) on update cascade
)

create table Bags(
UserID int not null,
ProductID int not null,
Status bit not null,
Stock int not null,
constraint PK_Bags primary key (UserID, ProductID),
constraint FK_Bags_User foreign key (UserID) references Users(UserID) on update cascade,
constraint FK_Bags_Product foreign key (ProductID) references Product(ProductID) on update cascade
)

create table Orders(
OrderID int identity(1,1) primary key,
UserOrder int not null,
DateOrder date default getdate(),
Status nvarchar(50) check (Status in (N'Unpaid',N'Paid',N'Delivered',N'Not delivery',N'Delivering')),
constraint FK_Order_User foreign key (UserOrder) references Users(UserID) on update cascade
)

create table OrderDetail(
OrderID int not null,
ProductID int not null,
StockOrder int not null,
PriceOrder decimal not null,
constraint PK_OrderDeteial primary key (OrderID, ProductID),
constraint FK_OrderDetail_Orders foreign key (OrderID) references Orders(OrderID) on update cascade,
constraint FK_OrderDetail_Products foreign key (ProductID) references Product(ProductID)
)

create table News (
NewsID int identity(1,1) primary key,
Title nvarchar(50) not null,
Description nvarchar(200) not null,
MetaContent nText not null,
DateUpdate date default getdate(),
Status bit not null,
ImageURL nvarchar(100) not null,
)
-- RoleDao--
if OBJECT_ID('usp_Role_getAll','p') is not null
	drop proc usp_Role_getAll
go
create proc usp_Role_getAll
As 
	select * from Role

if OBJECT_ID('usp_Role_addRole','p') is not null
	drop proc usp_Role_addRole
go
create proc usp_Role_addRole 
@roleName nvarchar(50)
as 
	insert into Role(RoleName)
	values(@roleName)

if OBJECT_ID('usp_Role_updateRole','p') is not null
	drop proc usp_Role_updateRole
go
create proc usp_Role_updateRole 
@roleName nvarchar(50), @roleID int
as 
	update Role set RoleName = @roleName where RoleID = @roleID

if OBJECT_ID('usp_Role_deleteRole','p') is not null
	drop proc usp_Role_deleteRole
go
create proc usp_Role_deleteRole 
@roleID int
as 
	delete from Role where RoleID = @roleID

if OBJECT_ID('usp_Role_getByRoleID','p') is not null
	drop proc usp_Role_getByRoleID
go
create proc usp_Role_getByRoleID @roleID int
as select * from Role where RoleID = @roleID

--UserDao--
if OBJECT_ID('usp_User_getAll','p') is not null
	drop proc usp_User_getAll
go
create proc usp_User_getAll
As 
	select * from Users

if OBJECT_ID('usp_User_addUser','p') is not null
	drop proc usp_User_addUser
go
create proc usp_User_addUser 
@userName nvarchar(50), @email nvarchar(50), @tel varchar(10), @password nvarchar(50), @status bit , @roleID int
as 
	insert into Users(UserName,Email,Tel,Password,Status,RoleID)
	values(@userName,@email,@tel,@password,@status,@roleID)
--bug
if OBJECT_ID('usp_User_updateUser','p') is not null
	drop proc usp_User_updateUser
go
create proc usp_User_updateUser 
@userID int ,@userName nvarchar(50), @email nvarchar(50), @tel varchar(10), @password nvarchar(50), @status bit , @roleID int
as 
	update Users set Email = @email, Tel = @tel, Password = @password, Status = @status, RoleID = @roleID where UserID = @userID

if OBJECT_ID('usp_User_updateFullUser','p') is not null
	drop proc usp_User_updateFullUser
go
create proc usp_User_updateFullUser 
@userID int ,@userName nvarchar(50), @email nvarchar(50), @tel varchar(10), @password nvarchar(50), @status bit , @roleID int, @firstName nvarchar(50), @lastName nvarchar(50), @address nvarchar(100), @zipcode varchar(20)
as 
	update Users set Email = @email, Tel = @tel, Password = @password, Status = @status, RoleID = @roleID , FirstName = @firstName, LastName = @lastName, Address = @address, Zipcode = @zipcode where UserID = @userID
--end bug
if OBJECT_ID('usp_User_deleteUser','p') is not null
	drop proc usp_User_deleteUser
go
create proc usp_User_deleteUser 
@userID int
as 
	delete from Users where UserID = @userID

if OBJECT_ID('usp_User_getByUserID','p') is not null
	drop proc usp_User_getByUserID
go
create proc usp_User_getByUserID @userID int
as select * from Users where UserID = @userID

-- CategoryDao --
if OBJECT_ID('usp_Category_getAll','p') is not null
	drop proc usp_Category_getAll
go
create proc usp_Category_getAll
As 
	select * from Category

if OBJECT_ID('usp_Category_addCategory','p') is not null
	drop proc usp_Category_addCategory
go
create proc usp_Category_addCategory 
@categoryName nvarchar(50)
as 
	insert into Category(CategoryName)
	values(@categoryName)

if OBJECT_ID('usp_Category_updateCategory','p') is not null
	drop proc usp_Category_updateCategory
go
create proc usp_Category_updateCategory 
@categoryName nvarchar(50), @categoryID int
as 
	update Category set CategoryName = @categoryName where CategoryID = @categoryID

if OBJECT_ID('usp_Category_deleteCategory','p') is not null
	drop proc usp_Category_deleteCategory
go
create proc usp_Category_deleteCategory 
@categoryID int
as 
	delete from Category where CategoryID = @categoryID

if OBJECT_ID('usp_Category_getByCategoryID','p') is not null
	drop proc usp_Category_getByCategoryID
go
create proc usp_Category_getByCategoryID @categoryID int
as select * from Category where CategoryID = @categoryID

-- ProductDao --
if OBJECT_ID('usp_Product_getAll','p') is not null
	drop proc usp_Product_getAll
go
create proc usp_Product_getAll
As 
	select * from Product

if OBJECT_ID('usp_Product_addProduct','p') is not null
	drop proc usp_Product_addProduct
go
create proc usp_Product_addProduct 
@productName nvarchar(50), @categoryID int, @price decimal, @stock int, @status bit, @imageURL nvarchar(100), @description nvarchar(100), @metaContent nText
as 
	insert into Product(ProductName,CategoryID,Price,Stock,Status,ImageURL,Description,MetaContent)
	values(@productName,@categoryID,@price,@stock,@status,@imageURL,@description,@metaContent)

if OBJECT_ID('usp_Product_updateProduct','p') is not null
	drop proc usp_Product_updateProduct
go
create proc usp_Product_updateProduct 
@productID int,@productName nvarchar(50), @categoryID int, @price decimal, @stock int, @status bit, @imageURL nvarchar(100), @description nvarchar(100), @metaContent nText, @date date
as 
	update Product set ProductName = @productName, CategoryID = @categoryID, Price = @price, Stock = @stock, DateUpdate = @date, Status = @status, ImageURL = @imageURL, Description = @description, MetaContent = @metaContent where ProductID = @productID

if OBJECT_ID('usp_Product_deleteProduct','p') is not null
	drop proc usp_Product_deleteProduct
go
create proc usp_Product_deleteProduct 
@productID int
as 
	delete from Product where ProductID = @productID

if OBJECT_ID('usp_Product_getByProductID','p') is not null
	drop proc usp_Product_getByProductID
go
create proc usp_Product_getByProductID @productID int
as select * from Product where ProductID = @productID

-- FeedbackDao --
if OBJECT_ID('usp_Feedback_getAll','p') is not null
	drop proc usp_Feedback_getAll
go
create proc usp_Feedback_getAll
As 
	select * from Feedback

if OBJECT_ID('usp_Feedback_addFeedback','p') is not null
	drop proc usp_Feedback_addFeedback
go
create proc usp_Feedback_addFeedback 
@userID int, @productID int, @status bit, @rating int
as 
	insert into Feedback(UserID,ProductID,Status,Rating)
	values(@userID,@productID,@status,@rating)

if OBJECT_ID('usp_Feedback_updateFeedback','p') is not null
	drop proc usp_Feedback_updateFeedback
go
create proc usp_Feedback_updateFeedback 
@userID int, @productID int, @status bit, @rating int, @date date
as 
	update Feedback set Status = @status, Rating = @rating, DateUpdate = @date where UserID = @userID and ProductID = @productID

if OBJECT_ID('usp_Feedback_deleteFeedback','p') is not null
	drop proc usp_Feedback_deleteFeedback
go
create proc usp_Feedback_deleteFeedback 
@userID int, @productID int
as 
	delete from Feedback where UserID = @userID and ProductID = @productID

if OBJECT_ID('usp_Feedback_getByFeedbackID','p') is not null
	drop proc usp_Feedback_getByFeedbackID
go
create proc usp_Feedback_getByFeedbackID @userID int, @productID int
as select * from Feedback where UserID = @userID and ProductID = @productID

-- BagsDao --
if OBJECT_ID('usp_Bags_getAll','p') is not null
	drop proc usp_Bags_getAll
go
create proc usp_Bags_getAll
As 
	select * from Bags

if OBJECT_ID('usp_Bags_addBags','p') is not null
	drop proc usp_Bags_addBags
go
create proc usp_Bags_addBags 
@userID int, @productID int, @status bit, @stock int
as 
	insert into Bags(UserID,ProductID,Status,Stock)
	values(@userID,@productID,@status,@stock)

if OBJECT_ID('usp_Bags_updateBags','p') is not null
	drop proc usp_Bags_updateBags
go
create proc usp_Bags_updateBags 
@userID int, @productID int, @status bit, @stock int
as 
	update Bags set Status = @status, Stock = @stock where UserID = @userID and ProductID = @productID

if OBJECT_ID('usp_Bags_deleteBags','p') is not null
	drop proc usp_Bags_deleteBags
go
create proc usp_Bags_deleteBags 
@userID int, @productID int
as 
	delete from Bags where UserID = @userID and ProductID = @productID

if OBJECT_ID('usp_Bags_getByBagsID','p') is not null
	drop proc usp_Bags_getByBagsID
go
create proc usp_Bags_getByBagsID @userID int, @productID int
as select * from Bags where UserID = @userID and ProductID = @productID

-- OrderDao --
if OBJECT_ID('usp_Order_getAll','p') is not null
	drop proc usp_Order_getAll
go
create proc usp_Order_getAll
As 
	select * from Orders

if OBJECT_ID('usp_Order_addOrder','p') is not null
	drop proc usp_Order_addOrder
go
create proc usp_Order_addOrder 
@userOrder int, @status nvarchar(50)
as 
	insert into Orders(UserOrder,Status)
	values(@userOrder,@status)

if OBJECT_ID('usp_Order_updateOrder','p') is not null
	drop proc usp_Order_updateOrder
go
create proc usp_Order_updateOrder 
@orderID int ,@userOrder int, @status nvarchar(50), @date date
as 
	update Orders set UserOrder = @userOrder, Status = @status, DateOrder = @date where OrderID = @orderID

if OBJECT_ID('usp_Order_deleteOrder','p') is not null
	drop proc usp_Order_deleteOrder
go
create proc usp_Order_deleteOrder 
@orderID int
as 
	delete from Orders where OrderID = @orderID

if OBJECT_ID('usp_Order_getByOrderID','p') is not null
	drop proc usp_Order_getByOrderID
go
create proc usp_Order_getByOrderID @orderID int
as select * from Orders where OrderID = @orderID

-- OrderDetailDao --
if OBJECT_ID('usp_OrderDetail_getAll','p') is not null
	drop proc usp_OrderDetail_getAll
go
create proc usp_OrderDetail_getAll
As 
	select * from OrderDetail

if OBJECT_ID('usp_OrderDetail_addOrderDetail','p') is not null
	drop proc usp_OrderDetail_addOrderDetail
go
create proc usp_OrderDetail_addOrderDetail 
@orderID int, @productID int, @stockOrder int, @priceOrder decimal
as 
	insert into OrderDetail(OrderID,ProductID,StockOrder,PriceOrder)
	values(@orderID,@productID,@stockOrder,@priceOrder)

if OBJECT_ID('usp_OrderDetail_updateOrderDetail','p') is not null
	drop proc usp_OrderDetail_updateOrderDetail
go
create proc usp_OrderDetail_updateOrderDetail 
@orderID int ,@productID int, @stockOrder int, @priceOrder decimal
as 
	update OrderDetail set StockOrder = @stockOrder, PriceOrder = @priceOrder where OrderID = @orderID and ProductID = @productID

if OBJECT_ID('usp_OrderDetail_deleteOrderDetail','p') is not null
	drop proc usp_OrderDetail_deleteOrderDetail
go
create proc usp_OrderDetail_deleteOrderDetail 
@orderID int ,@productID int
as 
	delete from OrderDetail where OrderID = @orderID and ProductID = @productID

if OBJECT_ID('usp_OrderDetail_getByOrderDetailID','p') is not null
	drop proc usp_OrderDetail_getByOrderDetailID
go
create proc usp_OrderDetail_getByOrderDetailID @orderID int ,@productID int
as select * from OrderDetail where OrderID = @orderID and ProductID = @productID

-- NewsDao --
if OBJECT_ID('usp_News_getAll','p') is not null
	drop proc usp_News_getAll
go
create proc usp_News_getAll
As 
	select * from News

if OBJECT_ID('usp_News_addNews','p') is not null
	drop proc usp_News_addNews
go
create proc usp_News_addNews 
@title nvarchar(50), @description nvarchar(200), @metaContent nText, @status bit, @imageURL nvarchar(100)
as 
	insert into News(Title,Description,MetaContent,Status,ImageURL)
	values(@title,@description,@metaContent,@status,@imageURL)

if OBJECT_ID('usp_News_updateNews','p') is not null
	drop proc usp_News_updateNews
go
create proc usp_News_updateNews 
@newsID int,@title nvarchar(50), @description nvarchar(200), @metaContent nText, @status bit, @imageURL nvarchar(100), @date date
as 
	update News set Title = @title,Description = @description, MetaContent = @metaContent, Status= @status, ImageURL=@imageURL, DateUpdate = @date where NewsID = @newsID

if OBJECT_ID('usp_News_deleteNews','p') is not null
	drop proc usp_News_deleteNews
go
create proc usp_News_deleteNews 
@newsID int
as 
	delete from News where NewsID = @newsID

if OBJECT_ID('usp_News_getByNewsID','p') is not null
	drop proc usp_News_getByNewsID
go
create proc usp_News_getByNewsID @newsID int
as select * from News where NewsID = @newsID
