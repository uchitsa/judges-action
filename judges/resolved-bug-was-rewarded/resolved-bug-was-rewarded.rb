# frozen_string_literal: true

# MIT License
#
# Copyright (c) 2024 Zerocracy
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

require 'fbe/conclude'

Fbe.conclude do
  on '(and (eq what "bug-was-resolved")
    (exists seconds)
    (exists when)
    (exists issue)
    (exists repository)
    (exists who)
    (eq is_human 1))'
  follow 'repository issue who'
  draw do |n, _resolved|
    n.award = 30
    n.when = Time.now
    n.why =
      'Thanks for closing this issue! ' \
      "You've earned #{n.award} points for this."
    "It's time to reward #{J.who(n)} for the bug resolved in " \
      "#{J.issue(n)}, the reward amount is #{J.award(n)}; " \
      'this reward should be delivered to the user by one of the future judges.'
  end
end
