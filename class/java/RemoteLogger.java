import java.util.UUID;
import java.io.DataOutputStream;
import java.io.StringWriter; 
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.net.URL;
import java.net.HttpURLConnection;

import android.os.AsyncTask;
import org.json.JSONObject;
import org.json.JSONArray;

/*
 * @Author: bla5r
 * @Date: 02-14-2017
 */

public class RemoteLogger {

	static private final String URL = "%RL_URL%";
	static private final String EXECID = UUID.randomUUID().toString(); 
	static private int REQUEST = 1;
	static private JSONArray VARS = new JSONArray();
	static private JSONArray STACK = new JSONArray();

	/*
	 * Desc: Add a value (String) to data
	 * Smali usage:
	 * const-string v0, "key"
	 *
     * const-string v1, "value"
	 *
     * invoke-static {v0, v1}, LRemoteLogger;->add(Ljava/lang/String;Ljava/lang/String;)V
	 */

	static public void add(String key, String value) {
		try {
			JSONObject obj = new JSONObject();
			obj.put("key", key);
			obj.put("value", value);
			RemoteLogger.VARS.put(obj);
		}
		catch (Exception e) {
			RemoteLogger.error(e, "Unable to add string value: " + value);
		}
	}

	/*
	 * Desc: Add a value (int) to data
	 * Smali usage:
	 * const-string v0, "key"
	 *
     * const/4 v1, 0x1
	 *
     * invoke-static {v0, v1}, LRemoteLogger;->add(Ljava/lang/String;I)V
	 */

	static public void add(String key, int value) {
		try {
			JSONObject obj = new JSONObject();
			obj.put("key", key);
			obj.put("value", value);
			RemoteLogger.VARS.put(obj);
		}
		catch (Exception e) {
			RemoteLogger.error(e, "Unable to add int value: " + value);
		}
	}

	/*
	 * Desc: Add a value (long) to data
	 * Smali usage:
	 * const-string v0, "key"
	 *
     * const-wide/16 v1, 0x1
	 *
     * invoke-static {v0, v1, v2}, LRemoteLogger;->add(Ljava/lang/String;J)V
	 */

	static public void add(String key, long value) {
		try {
			JSONObject obj = new JSONObject();
			obj.put("key", key);
			obj.put("value", value);
			RemoteLogger.VARS.put(obj);
		}
		catch (Exception e) {
			RemoteLogger.error(e, "Unable to add long value: " + value);
		}
	}

	/*
	 * Desc: Add a value (double) to data
	 * Smali usage:
	 * const-string v0, "key"
	 *
     * const-wide/high16 v1, 0x3ff0000000000000L    # 1.0
	 *
     * invoke-static {v0, v1, v2}, LRemoteLogger;->add(Ljava/lang/String;D)V
	 */

	static public void add(String key, double value) {
		try {
			JSONObject obj = new JSONObject();
			obj.put("key", key);
			obj.put("value", value);
			RemoteLogger.VARS.put(obj);
		}
		catch (Exception e) {
			RemoteLogger.error(e, "Unable to add double value: " + value);
		}
	}

	/*
	 * Desc: Add a value (boolean) to data
	 * Smali usage:
	 * const-string v0, "key"
	 *
     * const/4 v4, 0x1
	 *
     * invoke-static {v0, v1}, LRemoteLogger;->add(Ljava/lang/String;Z)V
	 */

	static public void add(String key, boolean value) {
		try {
			JSONObject obj = new JSONObject();
			obj.put("key", key);
			obj.put("value", value);
			RemoteLogger.VARS.put(obj);
		}
		catch (Exception e) {
			RemoteLogger.error(e, "Unable to add boolean value: " + value);
		}
	}

	/*
	 * Desc: Add a value (String) to data and send data to endpoint in JSON format
	 * Smali usage:
	 * const-string v0, "key"
	 *
     * const-string v1, "value"
	 *
     * invoke-static {v0, v1}, LRemoteLogger;->addAndFlush(Ljava/lang/String;Ljava/lang/String;)V
	 */

	static public void addAndFlush(String key, String value) {
		RemoteLogger.add(key, value);
		RemoteLogger.flush();
	}

	/*
	 * Desc: Add a value (int) to data and send data to endpoint in JSON format
	 * Smali usage:
	 * const-string v0, "key"
	 *
     * const/4 v1, 0x1
	 *
     * invoke-static {v0, v1}, LRemoteLogger;->addAndFlush(Ljava/lang/String;I)V
	 */

	static public void addAndFlush(String key, int value) {
		RemoteLogger.add(key, value);
		RemoteLogger.flush();
	}

	/*
	 * Desc: Add a value (long) to data and send data to endpoint in JSON format
	 * Smali usage:
	 * const-string v0, "key"
	 *
     * const-wide/16 v1, 0x1
	 *
     * invoke-static {v0, v1, v2}, LRemoteLogger;->addAndFlush(Ljava/lang/String;J)V
	 */

	static public void addAndFlush(String key, long value) {
		RemoteLogger.add(key, value);
		RemoteLogger.flush();
	}

	/*
	 * Desc: Add a value (double) to data and send data to endpoint in JSON format
	 * Smali usage:
	 * const-string v0, "key"
	 *
     * const-wide/high16 v1, 0x3ff0000000000000L    # 1.0
	 *
     * invoke-static {v0, v1, v2}, LRemoteLogger;->addAndFlush(Ljava/lang/String;D)V
	 */

	static public void addAndFlush(String key, double value) {
		RemoteLogger.add(key, value);
		RemoteLogger.flush();
	}

	/*
	 * Desc: Add a value (double) to data and send data to endpoint in JSON format
	 * Smali usage:
	 * const-string v0, "key"
	 *
     * const/4 v4, 0x1
	 *
     * invoke-static {v0, v1}, LRemoteLogger;->addAndFlush(Ljava/lang/String;Z)V
	 */

	static public void addAndFlush(String key, boolean value) {
		RemoteLogger.add(key, value);
		RemoteLogger.flush();
	}

	/*
	 * Desc: Add stack trace to data
	 * Smali usage:
	 * invoke-static {}, LRemoteLogger;->addStackTrace()V
	 */

	static public void addStackTrace() {
		try {
			StringWriter sw = new StringWriter();
			new Throwable().printStackTrace(new PrintWriter(sw));
			RemoteLogger.STACK.put(sw.toString());
		}
		catch (Exception e) {
			RemoteLogger.error(e, "Unable to add stack trace");
		}
	}

	/*
	 * Desc: Send data to endpoint in JSON format
	 * Smali usage:
	 * invoke-static {}, LRemoteLogger;->flush()V
	 */

	static public void flush() {
		try {
			JSONObject obj = new JSONObject();
			obj.put("ts", System.currentTimeMillis());
			obj.put("exec", RemoteLogger.EXECID);
			obj.put("r", RemoteLogger.REQUEST);
			obj.put("vars", RemoteLogger.VARS);
			RemoteLogger.VARS = new JSONArray();
			obj.put("stack", RemoteLogger.STACK);
			RemoteLogger.STACK = new JSONArray();
			new Sender().execute(obj.toString());
			RemoteLogger.REQUEST++;
		}
		catch (Exception e) {
			RemoteLogger.error(e, "Unable to flush");
		}
	}

	/*
	 * Desc: Print error in exception case
	 * Smali usage:
	 * (private method)
	 */

	static private void error(Exception e, String reason) {
		System.err.println("[RemoteLogger] " + reason);
        e.printStackTrace();
	}

	/*
	 * Desc: Send request to endpoint
	 * Smali usage:
	 * (protected class)
	 */

	static protected class Sender extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... json) {
        	try {
        		for (final String data : json) {
        			URL url = new URL(RemoteLogger.URL);
        			HttpURLConnection con = (HttpURLConnection)url.openConnection();
        			con.setRequestMethod("POST");
        			con.setRequestProperty("Content-Type", "application/json");
        			con.setDoOutput(true);
					DataOutputStream wr = new DataOutputStream(con.getOutputStream());
					wr.writeBytes(data);
					wr.flush();
					wr.close();
        			con.getResponseCode();
        		}
        	}
        	catch (Exception e) {
        		RemoteLogger.error(e, "Unable to send request");
        	}
            return (null);
        }
    }

}
