# set supervisors and departments
# to simulate company directory

sales_supervisor = Supervisor.create(
	name: 'Joel Walker'
)
sales_department = Department.create(
	supervisor: sales_supervisor,
	name: 'Sales'
)

hr_supervisor = Supervisor.create(
	name: 'Carlos Mendez'
)
hr_department = Department.create(
	supervisor: hr_supervisor,
	name: 'HR'
)

dev_supervisor = Supervisor.create(
	name: 'Sue-ting Cheng'
)
dev_department = Department.create(
	supervisor: dev_supervisor,
	name: 'Development'
)

# contacts in case audition is actually run
# and since testing manually - can't wait to learn testing

sales_contact_1 = Contact.create(
	department: sales_department,
	name: 'Becky Baker',
	business_phone: '775-987-1212',
	business_extension: '111',
	home_phone: '530-765-1212',
	emergency_contact_name: 'Tom Jones',
	emergency_contact_phone: '530-765-1212'
)

sales_contact_2 = Contact.create(
	department: sales_department,
	name: 'John Smith',
	business_phone: '775-987-1212',
	business_extension: '112',
	home_phone: '775-582-5323',
	emergency_contact_name: 'Sue Smith',
	emergency_contact_phone: '775-852-1223'
)

sales_contact_3 = Contact.create(
	department: sales_department,
	name: 'Michael Carson',
	business_phone: '775-987-1212',
	business_extension: '113',
	home_phone: '775-651-1041',
	emergency_contact_name: 'Mrs. Carson',
	emergency_contact_phone: '775-980-0072'
)

dev_contact_1 = Contact.create(
	department: dev_department,
	name: 'Michael Jordan',
	business_phone: '775-987-4312',
	business_extension: '111',
	home_phone: '775-553-1043',
	emergency_contact_name: 'Siobhan Reynolds',
	emergency_contact_phone: '775-394-1042'
)

dev_contact_2 = Contact.create(
	department: dev_department,
	name: 'Valerie Conner',
	business_phone: '775-987-4312',
	business_extension: '112',
	home_phone: '775-999-5323',
	emergency_contact_name: 'Jacob Conner',
	emergency_contact_phone: '775-814-2023'
)
