<form class="account-form">
    <div class="account-form__item">
        <label for="firstName" class="required">First name</label>
        <input type="text" id="firstName" name="firstName" placeholder="Frank" autocomplete="given-name">
        <span class="error" data-error-for="firstName"></span>
    </div>
    <div class="account-form__item">
        <label for="lastName" class="required">Last name</label>
        <input type="text" id="lastName" name="lastName" placeholder="Smith" autocomplete="family-name">
        <span class="error" data-error-for="lastName"></span>
    </div>
    <div class="account-form__item">
        <label for="email" class="required">Email address</label>
        <input type="email" id="email" name="email" placeholder="frankie@gmail.com" autocomplete="email">
        <span class="error" data-error-for="email"></span>
    </div>
    <div class="account-form__item">
        <label for="mobileNumber" class="required">Mobile number</label>
        <input type="text" id="mobileNumber" name="mobileNumber" placeholder="0401 234 567" autocomplete="tel">
        <span class="error" data-error-for="mobileNumber"></span>
    </div>
    <div class="account-form__item">
        <label for="countries" class="required">Country</label>

        <select name="countries" id="countries">
            <option value="" disabled selected hidden>Select</option>
            <option value="Australia">Australia</option>
            <option value="NewZealand">New Zealand</option>
        </select>
        <span class="error" data-error-for="countries"></span>
    </div>
	
	<div class="hidden" name="statesDiv" id="statesDiv">
        <label class="required" for="states">State</label>

        <select name="states" id="states">
            <option value="" disabled selected hidden>Select</option>
            <option value="NSW">NSW</option>
            <option value="VIC">VIC</option>
            <option value="QLD">QLD</option>
            <option value="SA">SA</option>
            <option value="WA">WA</option>
            <option value="NT">NT</option>
            <option value="ACT">ACT</option>
            <option value="TAS">TAS</option>
        </select>
        <span class="error" data-error-for="states"></span>
    </div>
	
	<div class="account-form__item">
        <label for="addressLine1">Address Line 1</label>
        <input type="text" id="addressLine1" name="addressLine1" placeholder="Address" autocomplete="address-line1">
        <span class="error" data-error-for="addressLine1"></span>
    </div>
	
	<div class="account-form__item">
        <label for="addressLine2">Address Line 2</label>
        <input type="text" id="addressLine2" name="addressLine2" placeholder="Address" autocomplete="address-line2">
        <span class="error" data-error-for="addressLine2"></span>
    </div>
	
	<div class="account-form__item">
        <label for="city">Suburb/City</label>
        <input type="text" id="city" name="city" placeholder="Suburb/City" autocomplete="city">
        <span class="error" data-error-for="city"></span>
    </div>
	
	<div class="account-form__item">
        <label for="postCode">Postcode</label>
        <input type="text" id="postCode" name="postCode" placeholder="Postcode" autocomplete="postal-code">
        <span class="error" data-error-for="postCode"></span>
    </div>
    <div class="account-form__item">
        <label for="licenseNumber" class="required">License Plate Number</label>
        <input type="text" id="licenseNumber" name="licenseNumber" placeholder="523 NL7">
        <span class="error" data-error-for="licenseNumber"></span>
    </div>
    <div class="checkboxes-group">
        <div class="account-form__item account-form__item--checkbox">
            <label class="custom-checkbox-sp">I am 18+ and agree to the <a href="{{$langPrefix}}/about/stuff-to-know/">terms and conditions</a>
                <input id="terms" type="checkbox" name="terms" type="checkbox">
                <span class="checkmark"></span>
              </label>
            <span class="error" data-error-for="terms"></span>
        </div>
  
          <div class="account-form__item account-form__item--checkbox">
            <label class="custom-checkbox-sp">I am happy to receive deals, discounts and other marketing and event related information. You can unsubscribe at any time by opting out in Account Preferences
                <input id="offers" type="checkbox" name="offers" type="checkbox">
                <span class="checkmark"></span>
              </label>
        </div>

    </div>
    <div class="account-form__loader-wrapper">
        <div class="lds-ripple loader" style="display: none;">
            <div></div>
            <div></div>
        </div>
    </div>
    <div class="account-form__booking-wrapper">
        <div class="car-park-detail__book">
            <div class="wrapper">
                <button data-action="submit" class="account-form__cta disabled" type="submit">
                            Save Changes
                        </button>
            </div>
        </div>
    </div>
</form>