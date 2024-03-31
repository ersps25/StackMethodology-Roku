sub init()
    m.signupButton = m.top.findNode("signupButton")
    m.signupButton.observeField("buttonSelected", "onSignUpSelected")
    m.signupButton.setFocus(true)

    signinlabelid = m.top.findNode("signinlabelid")
    signinlabelid.font.size = 65
end sub

sub setFocus()
    m.signupButton.setFocus(true)
end sub

sub onSignUpSelected()
    m.top.contentselect = "Signup"
end sub