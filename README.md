# A bug in Molinillo.

If you run `bundle install`, you'll see the following list of errors:

```
Bundler could not find compatible versions for gem "does-not-exist":
  In Gemfile:
    dep2 was resolved to 0.0.1, which depends on
      does-not-exist (= 1.0.0)

Could not find gem 'does-not-exist (= 1.0.0)', which is required by gem 'dep2', in any of the sources.

Bundler could not find compatible versions for gem "librato-metrics":
  In Gemfile:
    librato-metrics (= 1.5.0)

    dependency was resolved to 0.0.1, which depends on
      librato-metrics
```

The first error is legitimate: There is no version of "does-not-exist", so naturally,
Bundler will not be able to find any compatible versions.

But the second error is spurious: Bundler did find a compatible version of librato-metrics. But
the error shows up because during the resolution process, the Molinillo library considered a
group of `librato-metrics` versions in the 2.x series, and rejected all of them. But then it
considered another group of `librato-metrics` versions and found that version 1.5.0 is compatible
with both `bundler-test` and `dependency`.

But the error message remains. I encountered an error like this while trying to upgrade a large, commercial
project from Rails 4.x to Rails 5. It confused me, and there was nothing about it on Google or Stack Overflow
(and when I posted my own question, nobody answered). So I debugged it myself until I found the cause (roughly).

I might even have a fix for this problem.
