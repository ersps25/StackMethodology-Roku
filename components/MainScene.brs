sub init()
    initScreenStack()
    m.top.backgroundColor = "#F1A00C"
    m.top.backgroundUri = ""

    m.signinButton = m.top.findNode("signinButton")
    m.signinButton.observeField("buttonSelected", "onSigninSelected")
    m.signinButton.setFocus(true)

    labelid = m.top.findNode("labelid")
    labelid.font.size = 65
    'createScreen("SignIn", "SignInScreen")
end sub

sub onSigninSelected()
    hideScreen()
    createScreen("SignIn", "SignInScreen")
end sub

sub updateFocus()
    'm.signinButton.setFocus(true)
end sub

sub contentSelected()
    if m.top.contentSelect <> invalid
        hideScreen()
        createScreen("Signup", "SignupScreen")
    end if

end sub

'Do the event handling
sub onKeyEvent(key as string, press as boolean) as boolean
    result = false
    if press then

        if key = "back"
            if m.screenStack.Count() > 1
                closeScreen()
                'updateFocus()
                result = true
            end if
        end if

        return result
    end if
end sub