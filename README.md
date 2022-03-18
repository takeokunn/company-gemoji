# company-gemoji

Add [gemoji](https://github.com/github/gemoji) keywords to company-mode keywords alist.

## Config

```emacs-lisp
(add-hook 'text-mode-hook
          (lambda ()
            (add-to-list 'company-backends #'company-gemoji))
```
