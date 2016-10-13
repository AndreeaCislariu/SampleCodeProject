//
//  LoginViewController.swift
//  TreatTicket
//
//  Created by AndreeaJipa on 15/03/15.
//  Copyright (c) 2015 TreatTicket. All rights reserved.
//

import UIKit

class LoginViewController: GAITrackedViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var noAccountLabel: UILabel!
    var forgotPasswordViewController:ForgotPasswordPopupViewController?
    var counter:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Customize Layout
        self.customizeLayout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // Add observers for keyboard notifications
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewControllerBk.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewControllerBk.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        // Track the screen name
        self.screenName = GA_LoginScreen
    }
    
    override func viewWillDisappear(animated: Bool) {
        // Remove all observers when the view is no longer visible
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    /*!
     * Handle UIKeyboardWillShowNotification notification to adjust the scroll contentSize
     */
    func keyboardWillShow(notification: NSNotification) {
        let keyboardSize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height + keyboardSize.height)
    }
    
    /*!
     * Handle UIKeyboardWillHideNotification notification to adjust the scroll contentSize
     */
    func keyboardWillHide(notification: NSNotification) {
        let keyboardSize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height - keyboardSize.height)
    }
    
    /*!
     * Method used for all the UI customizations
     */
    func customizeLayout()
    {
        // Color
        self.view.backgroundColor = Login_BackgroundColor
        self.headerLabel.textColor = Login_HeaderTextColor
        self.forgotPasswordButton.backgroundColor = Login_ForgotPasswordButtonBackgroundColor
        self.forgotPasswordButton.setTitleColor(Login_ForgotPasswordButtonLabelColor, forState: UIControlState.Normal)
        self.loginButton.backgroundColor = Login_LoginButtonBackgroundColor
        self.loginButton.setTitleColor(Login_LoginButtonLabelColor, forState: UIControlState.Normal)
        self.noAccountLabel.textColor = Login_DontHaveAnAccountLabelColor
        self.signUpButton.backgroundColor = Login_SignUpNowButtonBackgroundColor
        self.signUpButton.setTitleColor(Login_SignUpNowButtonLabelColor, forState: UIControlState.Normal)
        
        // Text
        self.headerLabel.text = NSLocalizedString("Login_HeaderLabel", comment: "")
        self.forgotPasswordButton.setTitle(NSLocalizedString("Login_ForgotPassword", comment: ""), forState: UIControlState.Normal)
        self.emailTextField.placeholder = NSLocalizedString("Login_EmailPlaceholder", comment: "")
        self.passwordTextField.placeholder = NSLocalizedString("Login_PasswordPlaceholder", comment: "")
        self.loginButton.setTitle(NSLocalizedString("Login_SignIn", comment: ""), forState: UIControlState.Normal)
        self.noAccountLabel.text = NSLocalizedString("Login_NoAccountQuestion", comment: "")
        self.noAccountLabel.sizeToFit()
        self.signUpButton.setTitle(NSLocalizedString("Login_SignUpNow", comment: ""), forState: UIControlState.Normal)
        
        // Font
        self.headerLabel.font = Login_HeaderTextFont
        self.emailTextField.font = Login_EmailTextFont
        self.passwordTextField.font = Login_PasswordTextFont
        self.forgotPasswordButton.titleLabel?.font = Login_ForgotPasswordTextFont
        self.loginButton.titleLabel?.font = Login_SignInButtonTextFont
        self.noAccountLabel.font = Login_NoAccountTextFont
        self.signUpButton.titleLabel?.font = Login_SignUpTextFont
        
        // Set rounded corner
        self.loginButton.layer.cornerRadius = Buttons_CornerRadius
        
        // Add Tap Gesture Recognizer to dismiss the keyboard when the view is tapped
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LoginViewControllerBk.dismissKeyboard)))
        
    }
    
    /*!
     * Resign keyboard on Return key pressed
     */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    /*!
     * Method used to show ForgotPasswordPopupViewController
     */
    func showForgotPassword(){
        if(forgotPasswordViewController == nil){
            // Open popup
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            forgotPasswordViewController = storyboard.instantiateViewControllerWithIdentifier("forgotPasswordPopupViewController") as? ForgotPasswordPopupViewController
            
            // If forgot password loaded from the storyboard successfully
            if(forgotPasswordViewController != nil)
            {
                // Set the frame
                forgotPasswordViewController!.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                // Show the ForgotPasswordPopupViewController
                self.view.addSubview(forgotPasswordViewController!.view)
                // Set the email text
                if(emailTextField.text != nil){
                    forgotPasswordViewController!.emailTextField.text = emailTextField.text
                }
            }
        }else{
            // Show the ForgotPasswordPopupViewController
            self.view.addSubview(forgotPasswordViewController!.view)
            // Set the email text
            if(emailTextField.text != nil){
                forgotPasswordViewController!.emailTextField.text = emailTextField.text
            }
        }
    }
    
    /*!
     * Method used to dismiss the keyboard
     */
    func dismissKeyboard(){
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    /*!
     * Method used to validate the form, make sure they are not empty
     */
    func validForm() -> Bool{
        let trimmedEmailString = emailTextField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let trimmedPasswordString = passwordTextField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        if(trimmedEmailString?.characters.count == 0 || trimmedPasswordString?.characters.count == 0){
            let alertView = UIAlertView(title: NSLocalizedString("AlertView_Error", comment: ""), message: NSLocalizedString("Login_EmptyFields", comment: ""), delegate: nil, cancelButtonTitle: NSLocalizedString("AlertView_OK", comment: ""))
            alertView.show()
            return false
        }
        
        return true
    }
    
    // MARK: - Buttons actions
    @IBAction func loginClick(sender: AnyObject) {
        // If the form is valid then make the API call to login the user
        if(self.validForm()){
            // Show the progress view until the API calls returns
            SVProgressHUD.setViewBackgroundColor(Loader_BackgroundColor)
            SVProgressHUD.setForegroundColor(Loader_ForegroundColor)
            SVProgressHUD.showWithMaskType(SVProgressHUDMaskType.Clear)
            SVProgressHUD.setRingThickness(Loader_Tickness)
            
            // Make the login API call
            APICallsController.login(currentUser!.deviceToken, email: emailTextField.text!, password: passwordTextField.text!, completionHandler:{response in
                switch response {
                case .Failure:
                    // Handle failure
                    // If the user fails to login on ForgotPasswordCounter attepts, then show the forgot password popup
                    self.counter += 1
                    if(self.counter == ForgotPasswordCounter){
                        self.showForgotPassword()
                        self.counter = 0
                    }
                    // Dismiss the loader
                    SVProgressHUD.dismiss()
                case .Response(let responseObject):
                    // Handle the response
                    // If the response object is in the correct format as Shopper object, then post a notification to let the app know the user logged in and update the UI and the Current logged in user profile
                    if let shopper = responseObject as? Shopper{
                        currentUser!.shopper = shopper
                        NSNotificationCenter.defaultCenter().postNotificationName(UpdateProfileTabNotification, object: nil)
                    }
                    // Dismiss the loader
                    SVProgressHUD.dismiss()
                default:SVProgressHUD.dismiss()
                }
            })
        }
    }
    
    @IBAction func forgotPasswordClick(sender: AnyObject) {
        self.showForgotPassword()
    }
}
