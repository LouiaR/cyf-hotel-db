const express = require('express');
const sqlite = require('sqlite3').verbose();
const router = express.Router();
const filename = './database/database.sqlite';
let db = new sqlite.Database(filename, (err) => {
  if (err) {
    return console.error(err.message);
  }
  console.log('Connected to the in-memory SQlite database.');
});

router.get('/customers', function (req, res) {
  var sql = 'select * from customers';
  db.all(sql, [], (err, rows) => {
    console.log((rows.length))
    res.status(200).json({
      customers: rows
    });
  });
});

router.get('/customers/:id', function (req, res) {
  // TODO: add code here
  var sql = 'select * from customers where id = ?';
  db.all(sql, [Number(req.params.id)], (err, rows) => {
    if (typeof (Number(req.params.id)) !== 'number' || rows.length === 0) {
      console.log('error');
      res.send('400 - BAD REQUEST');
    } else {
      console.log(rows)
      res.status(200).json({
        customers: rows
      });
    };
  })
});


router.get('/customers/name/:surname', function (req, res) {
  // TODO: add code here
  var sql = 'select * from customers where surname like ' + "'%" + req.params.surname + "%'";
  console.log(sql);
  db.all(sql, [], (err, rows) => {
    res.status(200).json({
      customers: rows
    });
  });
});


router.post('/customers/', function (req, res) {
  // EXPECTED JSON Object:
  // {
  //   title: 'Mr',
  //   firstname: 'Laurie',
  //   surname: 'Ainley',
  //   email: 'laurie@ainley.com'
  // }
 

  db.run(`INSERT INTO customers (title, firstname, surname, email) VALUES(?, ?, ?, ?)`, [req.body.title, req.body.firstname, req.body.surname, req.body.email], function(err) {
    if (err) {
      return console.log(err.message);
    }
    // get the last insert id
    console.log(`A row has been inserted with rowid ${this.lastID}`);
  });
  
});
 

router.put('/customers/:id', function (req, res) {
  // EXPECTED JSON Object:
  // {
  //   title: 'Mr',
  //   firstname: 'Laurie',
  //   surname: 'Ainley',
  //   email: 'laurie@ainley.com'
  // }
  // TODO: add code here
  let sql = `update customers set title = '${req.body.title}', firstname ='${req.body.firstname}', surname = '${req.body.surname}', email = '${req.body.email}' where id = '${req.params.id}'`
  db.run(sql, function(err) {
    if (err){
      console.log(err.message);
    } console.log(`Row(s) updated: ${this.changes}`);
  })
    
});


// get '/reservations'ti
// TODO: add code here
router.get('/reservations', (req, res)=> {
  let sql = 'select * from reservations';
  db.all(sql, [], (err, rows) => {
    res.status(200).json({
      reservations: rows
    });
  });
})


// get '/reservations/:id'
// TODO: add code here
router.get('/reservations/:id', (req, res)=> {
  var sql = 'select * from reservations where id = ?';
  db.all(sql, [Number(req.params.id)], (err, rows) => {
    if (typeof (Number(req.params.id)) !== 'number' || rows.length === 0) {
      console.log('error');
      res.send('400 - BAD REQUEST');
    } else {
      console.log(rows)
      res.status(200).json({
        customers: rows
      });
    };
  })
})

// delete '/reservations/:id'
// TODO: add code here
router.delete('/reservations/:id', (req, res)=> {
  var sql = 'delete from reservations where id = ?';
  db.all(sql, [Number(req.params.id)], (err, rows) => {
    if (typeof (Number(req.params.id)) !== 'number' || rows.length === 0) {
      console.log('error');
      res.send('400 - BAD REQUEST');
    } else {
      console.log(rows)
      res.status(200).json({
        customers: rows
      });
    };
  })
})

// get '/reservations/starting-on/:startDate'
// TODO: add code here
router.get('/reservations/starting-on/:startDate', (req, res)=> {
  let sql = 'select * from reservations where check_in_date = ?';
  db.all(sql, [req.params.startDate], (err, rows ) => {
    res.status(200).json({
      reservations: rows
    });
  });
});


// get '/reservations/active-on/:date'
// TODO: add code here


// post '/reservations'
// EXPECTED JSON Object:
// {
//   customer_id: 1,
//   room_id: 1,
//   check_in_date: '2018-01-20',
//   check_out_date: '2018-01-22',
//   room_price: 129.90
// }
// TODO: add code here
router.post('/reservations', (req, res)=> {
  db.run(`INSERT INTO reservations (customer_id, room_id, check_in_date, check_out_date, price) VALUES(?, ?, ?, ?, ?)`, [req.body.customer_id, req.body.room_id, req.body.check_in_date, req.body.check_out_date, req.body.price], function(err) {
    if (err) {
      return console.log(err.message);
    }
    // get the last insert id
    console.log(`A row has been inserted with rowid ${this.lastID}`);
  });
})


// get `/detailed-invoices'
// TODO: add code here
router.get('/detailed-invoices', (req, res)=> {
  let sql = 'select * from invoices';
  db.all(sql, [], (err, rows) => {
    res.status(200).json({
      invoices: rows
    });
  });  
})


// get `/reservations/details-between/:from_day/:to_day`
// TODO: add code here

module.exports = router;