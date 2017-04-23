version (executable)
{
	import core.thread;
	import core.time;
	import std.stdio;
	import xdo;

	void main()
	{
		xdo_t* h = xdo_new(null);

		stdout.writeln("Moving cursor 100 pixels to the right.");
		for (int i = 0; i < 100; i++)
		{
			xdo_move_mouse_relative(h, 1, 0);
			Thread.sleep(5.msecs);
		}

		stdout.writeln(`Sleeping for 5 seconds, then typing "aA"`);
		Thread.sleep(5.seconds);

		xdo_send_keysequence_window(h, CURRENTWINDOW, "a", 1);
		xdo_send_keysequence_window(h, CURRENTWINDOW, "A", 1);

		xdo_free(h);
	}

}