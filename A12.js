use A12
db.createCollection('EMPLOYEE')

db.EMPLOYEE.insertMany(
[
{'SSN':1,'Name':'Swamy','DeptNo':1},
{'SSN':2,'Name':'Tingri','DeptNo':1},
{'SSN':3,'Name':'Tenali','DeptNo':1},
{'SSN':4,'Name':'Vijay','DeptNo':1},
{'SSN':5,'Name':'Vinay','DeptNo':2},
{'SSN':6,'Name':'Daniel','DeptNo':2},
{'SSN':7,'Name':'Joseph','DeptNo':2},
{'SSN':8,'Name':'Alia','DeptNo':2},
{'SSN':9,'Name':'Kim','DeptNo':3},
{'SSN':10,'Name':'Gadafi','DeptNo':3},
{'SSN':11,'Name':'Osama','DeptNo':3},
{'SSN':12,'Name':'Saddam','DeptNo':3}
]
)

db.createCollection('ASSIGNED_TO')
db.ASSIGNED_TO.insertMany(
[
{SSN:1,ProjectNo:4},
{SSN:2,ProjectNo:4},
{SSN:3,ProjectNo:4},
{SSN:4,ProjectNo:1},
{SSN:5,ProjectNo:1},
{SSN:6,ProjectNo:4},
{SSN:7,ProjectNo:1},
{SSN:8,ProjectNo:4},
{SSN:9,ProjectNo:2},
{SSN:10,ProjectNo:3},
{SSN:11,ProjectNo:3},
{SSN:12,ProjectNo:3}
])

db.EMPLOYEE.find({DeptNo:1},{"SSN":1,"Name":1}).pretty()
db.ASSIGNED_TO.aggregate( [{"$match":{"ProjectNo":3}} ,
 {"$lookup":{"from":"EMPLOYEE","localField":"SSN","foreignField":"SSN","as":"Name"}},
 {$unwind:"$Name"},
 {$project:{"Name":"$Name.Name","_id":0}}])
