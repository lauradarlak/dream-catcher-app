Theme.create(name: 'Dogs')
Theme.create(name: 'Cats')
Theme.create(name: 'Cars')
Theme.create(name: 'Rainbows')
Theme.create(name: 'Garden')
Theme.create(name: 'Giant')
Theme.create(name: 'Laughing')
Theme.create(name: 'Telepathy')

User.create(username: 'dream_machine', email: 'dream_machine@email.com', password: 'dream_machine')
User.create(username: 'laura', email: 'laura@email.com', password: 'laura')

Dream.create(name: "Dog Chase", dream_date: "2018-11-01", user_id: 1, dream_details: "Curabitur turpis. In turpis. Fusce fermentum odio nec arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Sed a libero.

Suspendisse eu ligula. Vivamus euismod mauris. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Cras ultricies mi eu turpis hendrerit fringilla. Phasellus ullamcorper ipsum rutrum nunc.

Fusce neque. Aenean vulputate eleifend tellus. Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Nam commodo suscipit quam. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum.")

Dream.create(name: "Out of control car", dream_date: "2018-11-02", user_id: 1, dream_details: "Curabitur turpis. In turpis. Fusce fermentum odio nec arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Sed a libero.

Suspendisse eu ligula. Vivamus euismod mauris. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Cras ultricies mi eu turpis hendrerit fringilla. Phasellus ullamcorper ipsum rutrum nunc.

Fusce neque. Aenean vulputate eleifend tellus. Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Nam commodo suscipit quam. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum.")

Dream.create(name: "Psychics", dream_date: "2018-11-04", user_id: 2, dream_details: "Curabitur turpis. In turpis. Fusce fermentum odio nec arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Sed a libero.

Suspendisse eu ligula. Vivamus euismod mauris. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Cras ultricies mi eu turpis hendrerit fringilla. Phasellus ullamcorper ipsum rutrum nunc.

Fusce neque. Aenean vulputate eleifend tellus. Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Nam commodo suscipit quam. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum.")

DreamTheme.create(dream_id: 1, theme_id: 1)
DreamTheme.create(dream_id: 1, theme_id: 2)
DreamTheme.create(dream_id: 2, theme_id: 3)
DreamTheme.create(dream_id: 2, theme_id: 4)
DreamTheme.create(dream_id: 3, theme_id: 8)
DreamTheme.create(dream_id: 3, theme_id: 7)
