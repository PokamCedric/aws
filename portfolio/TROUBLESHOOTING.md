# Troubleshooting:

## Mixed Active Content

Mixed Active Content refers to content that has access to all or part of the HTTPS page's Document Object Model (DOM). This type of mixed content has the potential to alter the behavior of the HTTPS page and may lead to the theft of sensitive information. In addition to the risks already mentioned for passive mixed content, active mixed content is vulnerable to other attack vectors.

### How to Fix Your Website

The most effective strategy to avoid mixed content blocking is to serve all content as HTTPS instead of HTTP.

For your own domain, ensure that all content is served as HTTPS and update your links accordingly. In many cases, the HTTPS version of the content already exists, requiring only the addition of an "s" to links - from http:// to https://.

## Mime Type

MIME types define the media type of content, whether in email or served by web servers or web applications. They provide a clue on how the content should be processed and displayed.

**Examples of MIME types:**

- `text/html` for HTML documents.
- `text/plain` for plain text.
- `text/css` for Cascading Style Sheets.
- `text/javascript` for JavaScript files.
- `text/markdown` for Markdown files.
- `application/octet-stream` for binary files requiring user action.

### Importance of Correct MIME Types

Correct MIME types are crucial because if a web server or application reports an incorrect MIME type for content, a web browser cannot determine the author's intentions, leading to unexpected behavior.

**Reasons why correct MIME types are important:**

1. **Loss of Control**: If a browser ignores the reported MIME type, web administrators and authors lose control over how their content is processed. For instance, a website aimed at web developers might want to send certain example HTML documents as either `text/html` or `text/plain`, but if the browser guesses the MIME type, this choice is no longer available.

2. **Security**: Certain content types, like executable programs, are inherently unsafe. Therefore, these MIME types are usually restricted to control the actions a web browser takes when handling such content. Executable programs should not be executed on the user's computer without explicit user consent.

### How to Determine the Correct MIME Type

There are various methods to determine the correct MIME type for serving your content:

- Refer to the vendor's documentation if your content was created using commercial software to identify the recommended MIME types.
- Consult IANA's MIME Media Types registry, which contains information on all registered MIME types.
- Search for the file extension in FILExt or the File extensions reference to see associated MIME types. Pay attention as the application may have multiple MIME types differing by one letter.