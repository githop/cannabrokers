


# features

### Admin Panel - Auth

1. A user visits the /admin route
		expectation: authroization error flashed, they are redirected to the signin page

2. An admin can sign in on the sign_in route
		expectation: with valid credentials, auth then redirected to admin panel

### Admin actions

##flower
1. Admin can add flowers via admin panel.
	 Admin clicks add flower, submits completed form,redirects to show page where form input is displayed via template.

2. Admin can edit newly created flower.
	 Flower show page, admin clicks edit button, redirect to edit page, field is edited, flower show page is displayed with updated value.

##merchant

1. Admin can add a new merchant via admin panel.
	 Admin clicks add merchant, submits completed form, redirects to merchant show page where form input is displayed via template.

2. Admin can edit newly created merchant
	 Merchant show page, admin clicks edit button, redirect to edit page, field is edited, merchant show page is displayed with updated value

3. Admin can see a list of all merchants via admin panel.
	 Admin clicks see all merchants, redirected to merchant index where all merchants are shown. Option to add resources or edit merchant.

##equipment

1. Admin can add equipment via admin panel.
	 Admin clicks add equipment, submits completed form, redirects to equipment show page where form input is displayed via template

2. Admin can edit newly created equipment
	 Equipment show page, admin clicks edit equipment, redirects to edit page, field is edited and submitted, redirect to merchant show page where updated value is displayed.

##edibles

1. Admin can add edibles through merchant via admin panel
	 Admin clicks company name, submits completed form, redirects to merchant concentrate show page where form input is displayed via template

2. Admin can edit newly created edible
	 Merchant edible show page, admin clicks edit, redirects to edit page, field is edited and submitted, merchant edible show page is displayed with updated value

##concentrates

1. Admin can add concentrates through merchant via admin panel
	 Admin clicks company name, submits completed form, redirects to merchant concentrate show page where form input is displayed via template

2. Admin can edit newly created concentrate
	 Merchant concentrate show page, admin clicks edit, redirects to edit page, field is edited and submitted, merchant eidble show page is displayed with updated value.

