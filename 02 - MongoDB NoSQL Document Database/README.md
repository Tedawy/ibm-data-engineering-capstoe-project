# MongoDB NoSQL Document Database

>  The company needs to design a data platform with MongoDB as a NoSQL database to store the e-commerce catalog data.

## Objectives

In this assignment you will:

- import data into a MongoDB database.
- query data in a MongoDB database.
- export data from MongoDB.

## 1. Check the Dependencies

This assignment will be using `mongoimport` and `mongoexport` commands, we will check if we have them 

```bash
mongoimport
```
> ```bash
> mongoimport version: 100.9.4
> git version: ce6af0fefca324ad5d9cb689d335130f48c99699
> Go version: go1.20.12
>   os: linux
>   arch: amd64
>   compiler: gc
> ```

```bash
mongoexport
```
> ```bash
> mongoexport version: 100.9.4
> git version: ce6af0fefca324ad5d9cb689d335130f48c99699
> Go version: go1.20.12
>   os: linux
>   arch: amd64
>   compiler: gc
> ```

## 2. Import Catalog Data From JSON

We can see that we have both of them,Next we will download the data `catalog.json`
```bash
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0321EN-SkillsNetwork/nosql/catalog.json
```

Next, we will start mongo using the command `start_mongo`
Now we will create the database `catalog` and its collection `electronics`

```bash
mongosh -u root -p PASSWORD 
use catalog
db.createCollection('electronics')
```
Next we will exit `mongosh` and use the next command to load the data in our database `catalog`

```console
mongoimport -h localhost -p 27017 --db catalog --collection electronics --authenticationDatabase admin -u root -p PASSWORD catalog.json
```

> I also used mongodb locally on docker, created a container for `mongodb`  using the following command
> ```bash 
> docker run --name mongodb_container -d  -p 27017:27017 -v $(pwd):/data/db mongo
> ```
>
> Next run the container using the following command 
> ```bash
> docker exec -it mongodb_container bash
> ```
> Next, create a database named `catalog` and collection named `electronics`
>```bash 
> mongosh
>```

>```bash
> use catalog
> db.createCollection('electronics')
> show collection # to verify creating a collection
> ```

> Next to load the data, we will exit `mongosh` and use the bash for the following command
> ```bash
>mongoimport --uri "mongodb://localhost:27017/catalog" --collection electronics --type=json --file /data/db/catalog.json
> ```

## 3. Run Queries 

To display the list of databases we can use 2 commands:

- `show dbs`
```bash 
show dbs;
    admin     40.00 KiB
    catalog    8.00 KiB
    config    60.00 KiB
    local     72.00 KiB
    training  40.00 KiB
```

- `db.adminCommand({'listDatabases':1})`
```bash
    {
    databases: [
        { name: 'admin', sizeOnDisk: Long('40960'), empty: false },
        { name: 'catalog', sizeOnDisk: Long('8192'), empty: false },
        { name: 'config', sizeOnDisk: Long('73728'), empty: false },
        { name: 'local', sizeOnDisk: Long('73728'), empty: false },
        { name: 'training', sizeOnDisk: Long('40960'), empty: false }
    ],
    totalSize: Long('237568'),
    totalSizeMb: Long('0'),
    ok: 1
    }
```

To display the list of collections we can use 2 commands:

```bash 
use catalog
show collections
electronics
```

- `db.runCommand({'listCollections': 1})
```bash
    {
    cursor: {
        id: Long('0'),
        ns: 'catalog.$cmd.listCollections',
        firstBatch: [
        {
            name: 'electronics',
            type: 'collection',
            options: {},
            info: {
            readOnly: false,
            uuid: UUID('2b0396e3-6ea2-4da1-9606-6200a5f081c8')
            },
            idIndex: { v: 2, key: { _id: 1 }, name: '_id_' }
        }
        ]
    },
    ok: 1
    }
```

## 4. Create an index

To create an index in mongoDb we use the command 

```bash 
db.electronics.createIndex( { "type" : 1} )
```

and to show the index we can use the command 

```bash
db.electronics.getIndexes()

    [
        { v: 2, key: { _id: 1 }, name: '_id_' },
        { v: 2, key: { type: 1 }, name: 'type_1'}
    ]
```

## 5.  Write queries to understand our data

- Find the count of laptops

```bash 
db.electronics.count( {"type" : "laptop"} )
```
>```bash
>   389
>```

-  Find the number of smart phones with screen size of 6 inches.
```bash 
db.electronics.find( { "type" : "smart phone", "screen size":6 } ).count()
```
>```bash
>   8
>```

-  Find out the average screen size of smart phones
```bash
db.electronics.aggregate([
    {"$match" : {"type": "smart phone"}},
    {"$group" : {"_id" : "type" , "avg_val" : {"$avg": "$screen size"}}}
    ])
```
>```bash
>   [ { _id: 'type', avg_val: 6 } ]
>```


## 6.  Export Data 

- Finally, I will export the electronics collection into a file named `electronics.csv` using on the `_id`, `type`, and `model` columns.

```bash
mongoexport -u root -p --authenticationDatabase admin --db catalog --collection electronics --out electronics.csv --type=csv --fields _id,type,model
```
- Using Docker 

>```bash
>mongoexport --uri "mongodb://localhost:27017/catalog" --collection electronics --out electronics.csv --type=csv --fields _id type,model
>```