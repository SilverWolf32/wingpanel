/*-
 * Copyright (c) 2015 Wingpanel Developers (http://launchpad.net/wingpanel)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Library General Public License as published by
 * the Free Software Foundation, either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

public abstract class Wingpanel.Indicator : GLib.Object {
	public static const string APP_LAUNCHER = "app-launcher";
	public static const string SESSION = "session";
	public static const string DATETIME = "datetime";
	public static const string NETWORK = "network";
	public static const string MESSAGES = "messages";
	public static const string SOUND = "sound";
	public static const string POWER = "power";
	public static const string SYNC = "sync";
	public static const string PRINTER = "printer";
	public static const string BLUETOOTH = "bluetooth";
	public static const string KEYBOARD = "keyboard";

	/**
	* The type of the server displaying the indicator.
	*/
	public enum ServerType {
		SESSION,
		GREETER,
		OTHER
	}

	/**
	* The unique name representing the indicator.
	* It is also used for the indicator ordering.
	*/
	public string code_name { get; construct; }

	/**
	* The localised name of the indicator.
	*/
	public string display_name { get; construct; }

	/**
	* A short description of the indicator.
	*/
	public string description { get; construct; }

	/**
	* Defines if the indicator display widget should be shown or not.
	*/
	public bool visible { get; set; default=false; }

	/**
	* Returns the display widget that will be displayed in the panel.
	* Middle click and scroll events will be passed to this widget.
	* If get_widget () returns null all EventButton events will be passed.
	*
	* @return a {@link Gtk.Widget} that represents the status.
	*/
	public abstract Gtk.Widget get_display_widget ();

	/**
	* Returns the widget that will be displayed in the popover.
	* Return null if no popover should be shown.
	*
	* @param server The server the indicator is displayed on.
	*
	* @return a {@link Gtk.Widget} containing the popover interface.
	*/
	public abstract Gtk.Widget? get_widget (ServerType server);

	/**
	* Called when the indicator popover opened.
	*/
	public abstract void opened ();

	/**
	* Called when the indicator popover closed.
	*/
	public abstract void closed ();

	/**
	* Request a popover closing.
	*/
	public signal void close ();
}
