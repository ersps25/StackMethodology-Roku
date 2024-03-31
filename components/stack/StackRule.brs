'Initialize Screen Stack
sub initScreenStack()
    m.screens = m.top.findNode("screens")
    m.screenStack = []
end sub

'Create Object of the new Screen
function createScreen(screenName as string, id)
    m[screenName] = CreateObject("roSGNode", screenName)
    m[screenName].id = id
    m[screenName].name = screenName
    m[screenName].ObserveField("contentSelect", "contentSelected")
    showScreen(m.[screenName])
end function

'Display new screen on top of Scene.
sub showScreen(node as object)
    m.screens.AppendChild(node) ' add new screen to scene
    ' show new screen
    m.screenStack.Push(node) ' add new screen to the screen stack
    node.visible = true
    node.setFocus = true
end sub

'Close the current screen and make visible the previous screen
sub closeScreen()
    if m.screenStack.Count() > 1
        cur = m.screenStack[m.screens.getChildren(m.screens.getChildCount(), 0).Count() - 1]

        m.screens.removeChildIndex(m.screens.getChildren(m.screens.getChildCount(), 0).Count() - 1)
        m.screenStack.Pop() ' remove screen from screenStack
        ' take previous screen and make it visible
        prev = m.screenStack[m.screens.getChildren(m.screens.getChildCount(), 0).Count() - 1]

        if prev <> invalid
            prev.visible = true
            prev.setFocus = true
        end if
    else
        m.screens.removeChildIndex(m.screens.getChildren(m.screens.getChildCount(), 0).Count() - 1)
    end if
end sub

sub hideScreen()
    prev = m.screenStack[m.screens.getChildren(m.screens.getChildCount(), 0).Count() - 1]
    if prev <> invalid
        prev.visible = false
    end if
end sub

'Add new screen to Scene and stack
sub addScreen(node as object)
    m.screens.AppendChild(node) ' add new screen to scene
    m.screenStack.Push(node) ' add new screen to the screen stack
end sub

'Remove screen from stack and hide it.
sub clearScreenStack()
    if m.screenStack.Count() > 1
        while m.screenStack.Count() > 1
            last = m.screenStack.Pop() ' remove screen from screenStack
            if last.visible = true
                last.visible = false ' hide screen
            end if
            m.screens.RemoveChild(last)
        end while
    else
        m.screenStack.Peek().visible = false ' take current screen from screen stack but don't delete it
    end if
end sub

'Get the current screen but do not delete it from stack
function getCurrentScreen()
    return m.screenStack.Peek()
end function

'Check if screen is available in Stack
function isScreenInScreenStack(node as object) as boolean
    ' check if screen stack contains specified node
    for each screen in m.screenStack
        result = screen.IsSameNode(node)
        if result = true
            return true
        end if
    end for
    return false
end function