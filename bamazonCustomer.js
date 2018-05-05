var mysql = require("mysql");
var inquirer = require("inquirer");
var figlet = require("figlet");
var mysql = require("mysql");

// create the connection information for the sql database
var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "",
  database: "bamazon_db"
});

connection.connect(function(err) {
  if (err) throw err;
  // else console.log('connected');
  figlet();
  setTimeout(customerSelection, 1000);
});

figlet("$$$ Bamazon $$$", function(err, data) {
  if (err) {
      console.log('Something went wrong...');
      console.dir(err);
      return;
  }
  console.log(data)
});


function customerSelection() {
  connection.query("SELECT * FROM inventory", function(err, res) {
    if (err) throw err;
    // console.log(res);
    console.log ('========================== Welcome to Bamazon Auctions! =======================')
    console.log ('============================ See anything you like?!? =============================')
    console.log ('===================================================================================')

    res.forEach(function (itemList) {
      console.log(`ID ${itemList.item_id} || Product ${itemList.product_name} || Category ${itemList.department_name} || Price $${itemList.price}`);
    }); 
    setTimeout(customerPurchase, 1000); 
  });
}

function customerPurchase(){
    console.log ('====================================================================================')
    inquirer.prompt([
        {
          name: "itemID",
          type: "input",
          message: "Enter the ID Number of the Item You Want: ",
        },
        {
          name: "howMany",
          type: "input",
          message: "How many would you like to buy? ",
        }
      ])
      .then (selectedItem => {
        connection.query(`SELECT * FROM inventory WHERE item_id = ${selectedItem.itemID}`, function(err, res) {
          if (res[0].stock_qty > selectedItem.howMany) {
            console.log('You\'re in luck, we have plenty in stock!'); 
            let newQty = res[0].stock_qty - selectedItem.howMany; 
            let custPrice = selectedItem.howMany * res[0].price; 
            let custItem = res[0].product_name; 

            connection.query(`UPDATE products SET stock_qty = ${newQty} WHERE item_id = ${selectedItem.item_id}`, function(err,res) {
              console.log(`Your purchase of ${selectedItem.howMany} ${custItem}s is $${custPrice}`); 
              connection.end();   
            }); 
            } else {
              console.log('Not enough in stock! Please select again'); 
              customerPurchase(); 
            }
        }); 
      }); 
};