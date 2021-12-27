using Soup;

public class StylesHandler
{
# if LIBSOUP30
    public static void handler (Server server, Soup.ServerMessage msg, string path, GLib.HashTable? query) {
# else
    public static void handler (Server server, Soup.Message msg, string path, GLib.HashTable? query, Soup.ClientContext client) {
#endif
        var css = """
        @media (prefers-color-scheme: light) {
            :root {
                --bg-color: #fafafa;
                --link-color: #0366d6;
                --text-color: #222;
            }
        }

        @media (prefers-color-scheme: dark) {
            :root {
                --bg-color: #303030;
                --link-color: #398ff7;
                --text-color: #fafafa;
            }
        }

        body {
            font-family: Inter, system-ui, sans-serif;
            max-width: 960px;
            margin: 0 auto;
            padding: 0 6px;
            background: var(--bg-color);
            color: var(--text-color);
        }

        header {
            background: var(--bg-color);
            position: sticky;
            top: 0;
            padding: 20px 0 10px;
        }

        h1 {
            margin: 0;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        a {
            color: var(--link-color);
        }

        .listing {
            display: flex;
            flex-direction: column;
        }

        .listing .item {
            padding: 6px 10px;
            border-bottom: 1px solid #eee;
            display: flex;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .listing .item:last-child {
            border-bottom: none;
        }
        .listing .item:hover {
            background-color: #f5f5f5;
        }
        .item .icon {
            width: 24px;
            margin-right: 10px;
        }

        .item .icon.folder {
            content: url("data:image/svg+xml,%3Csvg version='1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 48 48' enable-background='new 0 0 48 48'%3E%3Cpath fill='%23FFA000' d='M40,12H22l-4-4H8c-2.2,0-4,1.8-4,4v8h40v-4C44,13.8,42.2,12,40,12z'/%3E%3Cpath fill='%23FFCA28' d='M40,12H8c-2.2,0-4,1.8-4,4v20c0,2.2,1.8,4,4,4h32c2.2,0,4-1.8,4-4V16C44,13.8,42.2,12,40,12z'/%3E%3C/svg%3E");
        }

        .item .icon.file {
            content: url('data:image/svg+xml,%3Csvg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" enable-background="new 0 0 48 48"%3E%3Cpolygon fill="%2390CAF9" points="40,45 8,45 8,3 30,3 40,13"/%3E%3Cpolygon fill="%23E1F5FE" points="38.5,14 29,14 29,4.5"/%3E%3C/svg%3E');
        }

        .item .icon.opened-folder {
            content: url('data:image/svg+xml,%3Csvg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" enable-background="new 0 0 48 48"%3E%3Cpath fill="%23FFA000" d="M38,12H22l-4-4H8c-2.2,0-4,1.8-4,4v24c0,2.2,1.8,4,4,4h31c1.7,0,3-1.3,3-3V16C42,13.8,40.2,12,38,12z"/%3E%3Cpath fill="%23FFCA28" d="M42.2,18H15.3c-1.9,0-3.6,1.4-3.9,3.3L8,40h31.7c1.9,0,3.6-1.4,3.9-3.3l2.5-14C46.6,20.3,44.7,18,42.2,18z"/%3E%3C/svg%3E');
        }

        .item .name {
            flex: 1;
        }

        """;

# if LIBSOUP30
        msg.set_status(200, _("OK"));
# else
        msg.status_code = 200;
#endif
        msg.set_response ("text/css", Soup.MemoryUse.COPY, css.data);
    }
}
