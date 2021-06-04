module Passbox

    def account_name_blank; return "Account Name cannot be empty, try again!!\n"; end
    def username_blank;     return "Username cannot be empty, try again!!\n"; end
    def password_blank;     return "Password cannot be empty, try again!!\n"; end
    def pin_blank;          return "Pin cannot be empty, try again!!\n"; end
    def cc_no_blank;        return "Credit/Debit Card cannot be empty, try again!!\n"; end
    def cc_exp_blank;       return "Card Expiry cannot be empty, try again!!\n"; end
    def cc_cvv_blank;       return "Card CVV cannot be empty, try again!!\n"; end

    # init.rb
    def pb_already_setup;   return "Your passbox is already setup. Please type 'passbox help' to see usage.\n"; end
    def pb_not_setup;       return "Passbox is not setup, please start with 'passbox init' command to start using passbox.\n"; end

    # accounts.rb
    def no_accounts;        return "\nNo records to show. Use 'passbox add' to create new account.\n\n"; end
    def enter_account_name; return "Please enter you account name: "; end
    def account_not_found;  return "Account not found, Use 'passbox list' to see all your existing accounts.\n"; end
    def multiple_accounts;  return "\nMultiple accounts found, please chose one: "; end
    def invalid_selection;  return "\nInvalid selection. Try again. Bye!!\n\n"; end

    # create.rb
    def too_many_attempts;      return "\nToo many attempts. Start again!!\n\n"; end
    def enter_account_name;     return "\nEnter you account name (alphabets/numbers/underscore/dash): "; end
    def account_already_exists; return "Account Name already exists, try different name!!\n"; end
    def account_name_invalid;   return "Alphabets, Numbers, Underscore and Dashes only, try again please!!\n"; end
    def enter_username;         return "Please enter in your username: "; end
    def enter_url;              return "Please enter in the login url: "; end
    def enter_note;             return "Enter note to self (optional): "; end
    def enter_cc_no;            return "Please enter in your credit/debit card number: "; end
    def enter_cc_exp;           return "Please enter your card expiry: "; end

    # update.rb
    def account_update_success; return "\nAccount details has been successfully updated!! \n"; end
    def update_instructions;    return "\nHit enter for no change or input a new value. \n"; end

    # auth.rb
    def enter_account_password;     return "Please enter your Account Password: "; end
    def enter_account_pin;          return "Please enter you Account Pin: "; end
    def enter_cc_cvv;               return "Please enter you Card CVV: "; end
    def enter_cc_pin;               return "Please enter you Card Pin: "; end
    def create_master_password;     return "Please create your master password (min 8 chars): "; end
    def re_enter_master_password;   return "\nPlease re-enter your master password: "; end
    def pb_setup_complete;          return "\n\nPassbox setup complete. Use 'passbox help' to explore.\n\n"; end
    def passwords_mismatch;         return "\n\nPasswords don't match. Try again!!\n\n"; end
    def password_validation;        return "\nPassword should be minimum 8 characters, try again!!\n"; end
    def enter_master_password;      return "Please enter your Master Password: "; end
    def thank_you;                  return "\n\nThank you for using passbox. Bye!!\n"; end
    def invalid_password;           return "\nInvalid Password!!\n"; end
    def auth_success;               return "Authentication Successful!!\n"; end
    def auth_failed;                return "Authentication Failed!!\n"; end

end