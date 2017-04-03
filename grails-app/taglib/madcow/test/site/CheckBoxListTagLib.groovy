package madcow.test.site
/**
 * CheckBoxListTagLib
 *
 * @author mcallon
 * 05/10/2009 9:20:57 AM
 *
 * NOT YET AVAILABLE in the latest stable GRAILS version, so based on copy from "contribute a tag" library page.
 * http://docs.codehaus.org/display/GRAILS/Contribute+a+Tag#ContributeaTag-checkBoxList
 *
 * Enhancements applied to copy :
 *      pass in optionValue to provide the actual attribute within the object to use for display purposes.
 */
public class CheckBoxListTagLib {

    // Checkbox list that can be used as a more user-friendly alternative to
    // a multiselect list box
        def checkBoxList = {attrs, body ->

        def from = attrs.from
        def value = attrs.value
        def cname = attrs.name
        def optionValue = attrs.optionValue
        def isChecked, ht, wd, style, html

        //  sets the style to override height and/or width if either of them
        //  is specified, else the default from the CSS is taken
        style = "style='"
        if(attrs.height)
            style += "height:${attrs.height};"
        if(attrs.width)
            style += "width:${attrs.width};"

        if (style.length() == "style='".length())
            style = ""
        else
            style += "'" // closing single quote

        html = "<ul class='CheckBoxList' " + style + ">"

        out << html

        from.each { obj ->

            // if we wanted to select the checkbox using a click anywhere on the label (also hover effect)
            // but grails does not recognize index suffix in the name as an array:
            //      cname = "${attrs.name}[${idx++}]"
            //      and put this inside the li: <label for='$cname'>...</label>

            //isChecked = (value?.contains(obj."${attrs.optionKey}"))? true: false
            isChecked = (value?.contains(obj))? true: false

            def objName = optionValue ? obj."$optionValue" : obj

            out << "<li>" <<
                    checkBox(name:cname, value:obj."${attrs.optionKey}", checked: isChecked) <<
                    "${objName}" << "</li>"
        }

        out << "</ul>"

    }
}

